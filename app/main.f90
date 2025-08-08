program main
    use convert
    implicit none
    
    real :: speed_value
    real :: converted_value
    character(len=10) :: unit
    character(len=100) :: input_line
    integer :: ios
    
    ! Display welcome message
    write(*,*) 'Speed Converter (km/h <-> mph)'
    write(*,*) '================================'
    write(*,*) 'Supported units: kmh, mph'
    write(*,*) ''
    
    ! Get input from user
    write(*,'(a)', advance='no') 'Enter speed value and unit (e.g., "100 kmh" or "60 mph"): '
    read(*,'(a)', iostat=ios) input_line
    
    if (ios /= 0) then
        write(*,*) 'Error: Invalid input format'
        stop 1
    end if
    
    ! Parse the input
    read(input_line, *, iostat=ios) speed_value, unit
    if (ios /= 0) then
        write(*,*) 'Error: Invalid input format. Please enter a number followed by a unit.'
        stop 1
    end if
    
    ! Convert unit to lowercase for comparison
    call to_lowercase(unit)
    
    ! Perform conversion based on unit
    select case (trim(unit))
        case ('kmh', 'km/h')
            converted_value = kmh_to_mph(speed_value)
            write(*,'(f0.2, a, f0.2, a)') speed_value, ' km/h = ', converted_value, ' mph'
            
        case ('mph')
            converted_value = mph_to_kmh(speed_value)
            write(*,'(f0.2, a, f0.2, a)') speed_value, ' mph = ', converted_value, ' km/h'
            
        case default
            write(*,*) 'Error: Invalid unit "', trim(unit), '"'
            write(*,*) 'Supported units are: kmh, km/h, mph'
            stop 1
    end select
    
contains
    
    ! Subroutine to convert string to lowercase
    subroutine to_lowercase(str)
        implicit none
        character(len=*), intent(inout) :: str
        integer :: i, ascii_val
        
        do i = 1, len_trim(str)
            ascii_val = iachar(str(i:i))
            if (ascii_val >= 65 .and. ascii_val <= 90) then
                str(i:i) = achar(ascii_val + 32)
            end if
        end do
    end subroutine to_lowercase
    
end program main
