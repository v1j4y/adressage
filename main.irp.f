program adress
    implicit none
    BEGIN_DOC
    ! This prints out an array of type ideter(natom) 
    ! for a given adress
    END_DOC

    integer,allocatable::ideter(:)
    integer::i,add

    allocate(ideter(natom))

    ideter=1
    ideter(1)=1
    ideter(2)=2
    ideter(3)=1
    ideter(4)=3
    ideter(5)=3
    ideter(6)=3
!C  do i=natom/2+1,natom
!C  ideter(i)=2
!C  enddo
!C  ideter(natom)=1
!C  ideter(1)=2

    call adr(ideter,add)
    write(6,*)(ideter(i),i=1,natom)
    write(6,*)'Adress = ',add
    write(6,*)'done'
    ideter=0
    call getdet(add,ideter)
    write(6,*)'Adress = ',add
    write(6,*)(ideter(i),i=1,natom)




10  FORMAT(B64,I8,F8.2)
15  FORMAT(B64,I8,I8,I8)
11  FORMAT(B64,I3,B64)
12  FORMAT(I5,$)
13  FORMAT(B64,B64)
14  FORMAT(B64,I8)
16  FORMAT(B64,I8,I8)
end
