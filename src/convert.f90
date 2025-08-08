module convert
    implicit none
    private
    
    ! Use double precision for better accuracy
    integer, parameter :: dp = kind(1.0d0)
    
    ! Conversion factor: 1 km/h = 0.621371192237 mph (more precise)
    real(dp), parameter :: KMH_TO_MPH_FACTOR = 0.621371192237334d0
    
    public :: kmh_to_mph, mph_to_kmh
    
contains
    
    ! Convert from km/h to mph
    function kmh_to_mph(speed_kmh) result(speed_mph)
        implicit none
        real, intent(in) :: speed_kmh
        real :: speed_mph
        
        speed_mph = real(real(speed_kmh, dp) * KMH_TO_MPH_FACTOR)
    end function kmh_to_mph
    
    ! Convert from mph to km/h
    function mph_to_kmh(speed_mph) result(speed_kmh)
        implicit none
        real, intent(in) :: speed_mph
        real :: speed_kmh
        
        speed_kmh = real(real(speed_mph, dp) / KMH_TO_MPH_FACTOR)
    end function mph_to_kmh
    
end module convert
