!  FortranPerfomanceTest.f90 
!
!  FUNCTIONS:
!  FortranPerfomanceTest - Entry point of console application.
!

!****************************************************************************
!
!  PROGRAM: FortranPerfomanceTest
!
!  PURPOSE:  Entry point for the console application.
!
!****************************************************************************

    program FortranPerfomanceTest

    use myModule
    
    implicit none
    
    real :: start_time, stop_time

    call cpu_time(start_time)
    call do_loops_no_calls()
    call cpu_time(stop_time)
    print *, "No call's:", &
      stop_time - start_time, "seconds"

    call cpu_time(start_time)
    call do_loops_with_calls()
    call cpu_time(stop_time)
    print *, "With call's:", &
      stop_time - start_time, "seconds"

    end program FortranPerfomanceTest
    
