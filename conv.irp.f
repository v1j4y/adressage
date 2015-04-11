subroutine conv(ideter,det)
    implicit none
    BEGIN_DOC
    ! this routine converts a detrminant in the old
    ! format into the new one and returns the determinant.
    END_DOC
    integer,INTENT(INOUT)::ideter(natom)
    integer,INTENT(INOUT)::det
    integer::i
    det=0
    do i=1,natom
        if(ideter(i).eq.2)then
            det=IBSET(det,i-1)
        endif
    enddo
end
