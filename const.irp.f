BEGIN_PROVIDER  [integer*16,nt1     ]
&BEGIN_PROVIDER [integer*16,nt2     ]
&BEGIN_PROVIDER [integer*16,nalpha  ]
&BEGIN_PROVIDER [integer*16,nbeta   ]
&BEGIN_PROVIDER [integer*16,rank    ]

    implicit none
    BEGIN_DOC
    ! provides nt1,nt2,rank
    END_DOC

    nt1=ceiling(gamma(real(natom+1,16))/(gamma(real(natom-ntrou+1,16))*gamma(real(ntrou+1,16))),16)
!C fix for parity
    isz=0
    if(mod(natom-ntrou+isz,2).eq.0)then
        nalpha=(natom-ntrou+isz)/2
        nbeta=(natom-ntrou-isz)/2
    else
        nalpha=(natom-ntrou+isz+1)/2
        nbeta=(natom-ntrou-isz-1)/2
    endif
    nt2=ceiling(gamma(real(natom-ntrou+1,16))/((gamma(real(nalpha+1,16))*gamma(real(nbeta+1,16)))),16)
    rank=nt1*nt2
    print *,'nt1=',nt1,'nt2=',nt2,'natoms=',natom ,'ntrou=',ntrou,'nalpha=',nalpha,'nbeta=',nbeta
END_PROVIDER
