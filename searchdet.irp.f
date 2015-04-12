subroutine searchdet(det,add)
    BEGIN_DOC
    ! this subroutine is at the heart of the idea
    ! it will generate all the determinants in a fixed order
    ! then find the posistion of the determinant given and
    ! return it's position in add.
    END_DOC
    integer,INTENT(INOUT)::det
    integer,INTENT(INOUT)::add
    integer::i,a,const
    i=1
    a=0
    print *,"enter"
    do while (i.le.(nt1*nt2))
        if(a.eq.det)then
            add=i-2
            print *,"leave",add,a
            EXIT
        endif

        const=1
        i+=1
!C      write(6,16)a,a,i-2
        do while(popcnt(a).ne.nbeta .or. const==1)
            a+=1
            const=0
        enddo
    enddo
    if(a.eq.det)then
    add=i-1
    endif


10  FORMAT(B64,I8,F8.2)
15  FORMAT(B64,I8,I8,I8)
11  FORMAT(B64,I3,B64)
12  FORMAT(I5,$)
13  FORMAT(B64,B64)
14  FORMAT(B64,I8)
16  FORMAT(B64,I8,I8)
end
