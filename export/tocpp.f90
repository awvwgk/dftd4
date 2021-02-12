program cpp_export
   use dftd4
   implicit none
   integer :: i, j

!   write(*, '(a)') &
!      "static const int refn[87] { 0,"
!   write(*, '(*(5(i7,","),/))') refn
!   write(*, '(a)') "};"
   do i = 1, 86
      write(*, '(*(g0))') &
         "// ", i
      write(*, '(*(g0))') &
         "static const double refcn", i, "[", refn(i), "] {"
      write(*, '(*(3(f21.14, ","),:, /))') refcovcn(:refn(i), i)
      write(*, '(a)') "};"

      write(*, '(*(g0))') &
         "static const double refq", i, "[", refn(i), "] {"
      write(*, '(*(3(f21.14, ","),:, /))') gffq(:refn(i), i)
      write(*, '(a)') "};"

      write(*, '(*(g0))') &
         "static const double refhq", i, "[", refn(i), "] {"
      write(*, '(*(3(f21.14, ","),:, /))') gffh(:refn(i), i)
      write(*, '(a)') "};"

      write(*, '(*(g0))') &
         "static const double refalpha", i, "[", 23*refn(i), "] {"
      write(*, '(*(5(f14.7, ","),:, /))') alphaiw(:, :refn(i), i)
      write(*, '(a)') "};"

      write(*, '(*(g0))') &
         "static const double refascale", i, "[", refn(i), "] {"
      write(*, '(*(3(f21.14, ","),:, /))') ascale(:refn(i), i)
      write(*, '(a)') "};"

      write(*, '(*(g0))') &
         "static const double refhcount", i, "[", refn(i), "] {"
      write(*, '(*(3(f21.14, ","),:, /))') hcount(:refn(i), i)
      write(*, '(a)') "};"

      write(*, '(*(g0))') &
         "static const int refsys", i, "[", refn(i), "] {"
      write(*, '(*(5(i7, ","),:, /))') refsys(:refn(i), i)
      write(*, '(a)') "};"

      write(*, '(*(g0))') &
         "static const int refc", i, "[", refn(i), "] {"
      write(*, '(*(5(i7, ","),:, /))') [3, (1, j = 2, refn(i))]
      write(*, '(a)') "};"
      write(*, '(a)')
   end do

   do i = 1, 17
      write(*, '(*(g0))') &
         "// sec. ", i

      write(*, '(*(g0))') &
         "static const double secalpha", i, "[23] {"
      write(*, '(*(5(f14.7, ","),:, /))') secaiw(:, i)
      write(*, '(a)') "};"

      write(*, '(*(g0))') &
         "static const double secscale", i, " {"
      write(*, '(*(3(f21.14, ","),:, /))') sscale(i)
      write(*, '(a)') "};"
      write(*, '(a)')
   end do

end program cpp_export
