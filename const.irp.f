BEGIN_PROVIDER [integer,nt1     ]
&BEGIN_PROVIDER [integer,nt2     ]
&BEGIN_PROVIDER [integer,nalpha  ]
&BEGIN_PROVIDER [integer,nbeta   ]
&BEGIN_PROVIDER [integer,rank    ]

    implicit none
    BEGIN_DOC
    ! provides nt1,nt2,rank
    END_DOC

    nt1=int(gamma(dble(natom+1))/(gamma(dble(natom-ntrou+1))*gamma(dble(ntrou+1))))
!C fix for parity
    isz=0
    if(mod(natom-ntrou+isz,2).eq.0)then
        nalpha=(natom-ntrou+isz)/2
        nbeta=(natom-ntrou-isz)/2
    else
        nalpha=(natom-ntrou+isz+1)/2
        nbeta=(natom-ntrou-isz-1)/2
    endif
    nt2=exp(gamma(dble(natom-ntrou+1))/(gamma(dble(nalpha+1))-gamma(float(nbeta+1))))
    rank=nt1*nt2
    print *,'nt1=',nt1,'nt2=',nt2,'natoms=',natom ,'ntrou=',ntrou,'nalpha=',nalpha,'nbeta=',nbeta
END_PROVIDER
