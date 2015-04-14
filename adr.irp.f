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
    integer::det,i,deth,addh,detnew,count

    det=0
    detnew=0
    deth=0
    count=0
    call conv(ideter,det,deth)
    print *,'---'
    Do i=0,natom-1
        if(BTEST(deth,i))then
            count=count+1
        endif
        if(BTEST(det,i))then
            detnew=IBSET(detnew,i-count)
        endif
    enddo
    det=detnew
    write(6,14)det,det
    write(6,14)deth,deth
    print *,'---'
    call searchdet(det,add,deth,addh)
    print *,'---'
    write(6,16)det,det,add
    write(6,16)deth,deth,addh
    print *,'---',add
    add = (nt2-add+1) + (addh-1)*(nt2)
    print *,add,addh


10  FORMAT(B64,I8,F8.2)
15  FORMAT(B64,I8,I8,I8)
11  FORMAT(B64,I3,B64)
12  FORMAT(I5,$)
13  FORMAT(B64,B64)
14  FORMAT(B64,I8)
16  FORMAT(B64,I8,I8)
end
