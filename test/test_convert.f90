program test_convert
    use convert
    implicit none
    
    logical :: all_tests_passed
    real, parameter :: TOLERANCE = 1.0e-5
    
    all_tests_passed = .true.
    
    write(*,*) 'Running speed conversion tests...'
    write(*,*) '================================='
    
    ! Test kmh_to_mph conversion
    call test_kmh_to_mph(all_tests_passed)
    
    ! Test mph_to_kmh conversion
    call test_mph_to_kmh(all_tests_passed)
    
    ! Test edge cases
    call test_edge_cases(all_tests_passed)
    
    ! Summary
    write(*,*) ''
    if (all_tests_passed) then
        write(*,*) 'All tests PASSED!'
        stop 0
    else
        write(*,*) 'Some tests FAILED!'
        stop 1
    end if
    
contains
    
    subroutine test_kmh_to_mph(all_passed)
        implicit none
        logical, intent(inout) :: all_passed
        real :: result
        real :: expected
        
        write(*,*) 'Testing kmh_to_mph...'
        
        ! Test 1: 100 km/h should be approximately 62.1371 mph
        result = kmh_to_mph(100.0)
        expected = 62.1371
        if (abs(result - expected) > TOLERANCE) then
            write(*,'(a,f0.6,a,f0.6)') '  FAIL: Expected ', expected, ', got ', result
            all_passed = .false.
        else
            write(*,'(a,f0.2,a,f0.2,a)') '  PASS: 100.00 km/h = ', result, ' mph'
        end if
        
        ! Test 2: 0 km/h should be 0 mph
        result = kmh_to_mph(0.0)
        expected = 0.0
        if (abs(result - expected) > TOLERANCE) then
            write(*,'(a,f0.6,a,f0.6)') '  FAIL: Expected ', expected, ', got ', result
            all_passed = .false.
        else
            write(*,'(a,f0.2,a,f0.2,a)') '  PASS: 0.00 km/h = ', result, ' mph'
        end if
        
        ! Test 3: 50 km/h
        result = kmh_to_mph(50.0)
        expected = 31.06855
        if (abs(result - expected) > TOLERANCE) then
            write(*,'(a,f0.6,a,f0.6)') '  FAIL: Expected ', expected, ', got ', result
            all_passed = .false.
        else
            write(*,'(a,f0.2,a,f0.2,a)') '  PASS: 50.00 km/h = ', result, ' mph'
        end if
        
    end subroutine test_kmh_to_mph
    
    subroutine test_mph_to_kmh(all_passed)
        implicit none
        logical, intent(inout) :: all_passed
        real :: result
        real :: expected
        
        write(*,*) 'Testing mph_to_kmh...'
        
        ! Test 1: 60 mph should be approximately 96.5604 km/h
        result = mph_to_kmh(60.0)
        expected = 96.5604
        if (abs(result - expected) > TOLERANCE) then
            write(*,'(a,f0.6,a,f0.6)') '  FAIL: Expected ', expected, ', got ', result
            all_passed = .false.
        else
            write(*,'(a,f0.2,a,f0.2,a)') '  PASS: 60.00 mph = ', result, ' km/h'
        end if
        
        ! Test 2: 0 mph should be 0 km/h
        result = mph_to_kmh(0.0)
        expected = 0.0
        if (abs(result - expected) > TOLERANCE) then
            write(*,'(a,f0.6,a,f0.6)') '  FAIL: Expected ', expected, ', got ', result
            all_passed = .false.
        else
            write(*,'(a,f0.2,a,f0.2,a)') '  PASS: 0.00 mph = ', result, ' km/h'
        end if
        
        ! Test 3: 30 mph
        result = mph_to_kmh(30.0)
        expected = 48.2802
        if (abs(result - expected) > TOLERANCE) then
            write(*,'(a,f0.6,a,f0.6)') '  FAIL: Expected ', expected, ', got ', result
            all_passed = .false.
        else
            write(*,'(a,f0.2,a,f0.2,a)') '  PASS: 30.00 mph = ', result, ' km/h'
        end if
        
    end subroutine test_mph_to_kmh
    
    subroutine test_edge_cases(all_passed)
        implicit none
        logical, intent(inout) :: all_passed
        real :: result_mph, result_kmh
        real :: original_value
        
        write(*,*) 'Testing edge cases...'
        
        ! Test round-trip conversion: kmh -> mph -> kmh
        original_value = 80.0
        result_mph = kmh_to_mph(original_value)
        result_kmh = mph_to_kmh(result_mph)
        
        if (abs(result_kmh - original_value) > TOLERANCE) then
            write(*,'(a,f0.6,a,f0.6)') '  FAIL: Round-trip conversion. Expected ', &
                original_value, ', got ', result_kmh
            all_passed = .false.
        else
            write(*,'(a,f0.2,a)') '  PASS: Round-trip conversion (80.00 km/h)'
        end if
        
        ! Test reciprocal relationship
        result_mph = kmh_to_mph(1.0)
        result_kmh = mph_to_kmh(1.0)
        if (abs(result_mph * result_kmh - 1.0) > TOLERANCE) then
            write(*,'(a)') '  FAIL: Reciprocal relationship test'
            all_passed = .false.
        else
            write(*,'(a)') '  PASS: Reciprocal relationship test'
        end if
        
    end subroutine test_edge_cases
    
end program test_convert
