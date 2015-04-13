BEGIN_PROVIDER  [integer(kind=selected_int_kind(16)),nt1     ]
&BEGIN_PROVIDER [integer(kind=selected_int_kind(16)),nt2     ]
&BEGIN_PROVIDER [integer(kind=selected_int_kind(16)),nalpha  ]
&BEGIN_PROVIDER [integer(kind=selected_int_kind(16)),nbeta   ]
&BEGIN_PROVIDER [integer(kind=selected_int_kind(16)),rank    ]

    implicit none
    BEGIN_DOC
    ! provides nt1,nt2,rank
    END_DOC

!C  nt1=ceiling(gamma(real(natom+1,16))/(gamma(real(natom-ntrou+1,16))*gamma(real(ntrou+1,16))),selected_int_kind(16))
    nt1=   nint(gamma(real(natom+1,16))/(gamma(real(natom-ntrou+1,16))*gamma(real(ntrou+1,16))),selected_int_kind(16))
!C fix for parity
    if(mod(natom-ntrou+2*isz,2).eq.0)then
        nalpha=(natom-ntrou+2*isz)/2
        nbeta=(natom -ntrou-2*isz)/2
    else
        nalpha=(natom-ntrou+2*isz+1)/2
        nbeta=(natom -ntrou-2*isz-1)/2
    endif
    nt2=   nint(gamma(real(natom-ntrou+1,16))/((gamma(real(nalpha+1,16))*gamma(real(nbeta+1,16)))),selected_int_kind(16))
    rank=nt1*nt2
    print *,'nt1=',nt1,'nt2=',nt2,'natoms=',natom ,'ntrou=',ntrou,'nalpha=',nalpha,'nbeta=',nbeta,'isz=',isz
END_PROVIDER
