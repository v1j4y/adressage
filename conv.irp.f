subroutine conv(ideter,det,deth)
    implicit none
    BEGIN_DOC
    ! this routine converts a detrminant in the old
    ! format into the new one and returns the determinant.
    END_DOC
    integer,INTENT(INOUT)::ideter(natom)
    integer,INTENT(INOUT)::det
    integer,INTENT(INOUT)::deth
    integer::i
    det=0
    do i=1,natom
        if(ideter(i).eq.2 .and. ideter(i).ne.3)then
            det=IBSET(det,i-1)
        elseif(ideter(i).eq.3)then
            deth=IBSET(deth,i-1)
        endif
    enddo
end
