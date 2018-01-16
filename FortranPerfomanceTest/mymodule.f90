    module myModule
    
    implicit none
    
    public
    
    public :: do_loops_no_calls
    public :: do_loops_with_calls
    
    contains
    
    subroutine do_loops_no_calls()
    
        real :: a, b
        real :: r
        !Teste adiciobar aqui umas cenas
        !coiso e tal
        !Teste aalteracoes externas
        do a = -5000000, 5000000
        do b = 0, 100
            if (a > 0) then
                r = real(a) - 10.0 * real(b) / 5.0
            else
                r = real(a) - 7.35 * real(b)**2.0
            endif 
        enddo
        enddo
    
    end subroutine do_loops_no_calls
    
    subroutine do_loops_with_calls()
    
        real, target :: a, b
        real :: r
        logical :: res
        real, pointer :: ap, bp
        
        do a = -5000000, 500000
        do b = 0, 100
            ap => a
            bp => b
            call operation(ap, bp, r) 
            res = readlock()
        enddo
        enddo
        
    end subroutine do_loops_with_calls
    
    subroutine operation(a, b, r)
    
        real, pointer, intent(in)  :: a, b
        real, intent(out) :: r
        logical :: res
        
        res = readlock()
        
        if (res) then
        if (a > 0) then
            r = a - 10.0 * b / 5.0
        else
            r = a - 7.35 * b**2.0
        endif
        endif
    
    end subroutine operation

    function readlock() result(x)
        
        logical, save :: r = .false.
        logical :: x
        
        if (r == .false.) then
            r = .true.
            x = .true.
        else
            r = .false.
            x = .false.
        endif
    
    end function readlock
        
    
    end module MyModule
    

