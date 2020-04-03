SUPPORTS_CXX := FALSE
ifeq ($(COMPILER),gnu)
  FC_AUTO_R8 :=  -fdefault-real-8 
  HAS_F2008_CONTIGUOUS := FALSE
  FFLAGS_NOOPT :=  -O0 
  SUPPORTS_CXX := TRUE
  FFLAGS :=   -fconvert=big-endian -ffree-line-length-none -ffixed-line-length-none 
  FIXEDFLAGS :=   -ffixed-form 
  SCC :=  gcc 
  SFC :=  gfortran 
  MPICC :=  mpicc  
  CFLAGS :=  -std=gnu99 
  MPIFC :=  mpif90 
  MPICXX :=  mpicxx 
  FREEFLAGS :=  -ffree-form 
  CXX_LINKER := FORTRAN
  SCXX :=  g++ 
endif
ifeq ($(MODEL),pop)
  CPPDEFS := $(CPPDEFS)  -D_USE_FLOW_CONTROL 
endif
ifeq ($(COMPILER),gnu)
  CPPDEFS := $(CPPDEFS)  -DFORTRANUNDERSCORE -DNO_R16 -DCPRGNU
  ifeq ($(compile_threaded),true)
    FFLAGS := $(FFLAGS)  -fopenmp 
    CFLAGS := $(CFLAGS)  -fopenmp 
  endif
  ifeq ($(DEBUG),TRUE)
    FFLAGS := $(FFLAGS)  -g -Wall -Og -fbacktrace -ffpe-trap=zero,overflow -fcheck=bounds 
    CFLAGS := $(CFLAGS)  -g -Wall -Og -fbacktrace -ffpe-trap=invalid,zero,overflow -fcheck=bounds 
  endif
  ifeq ($(DEBUG),FALSE)
    FFLAGS := $(FFLAGS)  -O 
    CFLAGS := $(CFLAGS)  -O 
  endif
  ifeq ($(compile_threaded),true)
    LDFLAGS := $(LDFLAGS)  -fopenmp 
  endif
endif
