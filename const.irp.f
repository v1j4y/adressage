BEGIN_PROVIDER [integer,nt1     ]
&BEGIN_PROVIDER [integer,nt2     ]
&BEGIN_PROVIDER [integer,nalpha  ]
&BEGIN_PROVIDER [integer,nbeta   ]

    implicit none
    BEGIN_DOC
    ! provides nt1,nt2,rank
    END_DOC

    nt1=exp(lgamma(float(natom+1))-lgamma(float(natom-ntrou+1))-lgamma(float(ntrou+1)))
!C fix for parity
    isz=0
    if(mod(natom-ntrou+isz,2).eq.0)then
        nalpha=(natom-ntrou+isz)/2
        nbeta=(natom-ntrou-isz)/2
    else
        nalpha=(natom-ntrou+isz+1)/2
        nbeta=(natom-ntrou-isz-1)/2
    endif
    nt2=exp(lgamma(float(natom-ntrou+1))-lgamma(float(nalpha+1))-lgamma(float(nbeta+1)))
    print *,'nt1=',nt1,'nt2=',nt2,'natoms=',natom ,'ntrou=',ntrou,'nalpha=',nalpha,'nbeta=',nbeta
END_PROVIDER
