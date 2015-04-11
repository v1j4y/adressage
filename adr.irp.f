subroutine adr(ideter,add)
    implicit none
    BEGIN_DOC
    ! this subroutine provides the address of a detrminant 
    ! given in old format.
    ! It searches in a list of generated determinants and
    ! matches the given determinant.
    END_DOC
    integer,INTENT(INOUT)::ideter(natom)
    integer,INTENT(INOUT)::add
    integer::det,i

    det=0
    call conv(ideter,det)
    write(6,14)det,det
    call searchdet(det,add)
    print *,add


10  FORMAT(B64,I8,F8.2)
15  FORMAT(B64,I8,I8,I8)
11  FORMAT(B64,I3,B64)
12  FORMAT(I5,$)
13  FORMAT(B64,B64)
14  FORMAT(B64,I8)
16  FORMAT(B64,I8,I8)
end
