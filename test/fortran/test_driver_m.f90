program unittests
    use toast     !< testing library
    use test_int_vector_m
    implicit none

    type(TestSuite) :: suite
    suite = TestSuite(name="FortsUnitTests")

    ! add the test cases here
    call suite%append(TestFortsIntVectorAppend(name="test_int_vector_append"))
    call suite%append(TestFortsIntVectorReset(name="test_int_vector_reset"))

    ! Run them and print output
    call suite%runall()
    call suite%printsummary()

    ! write to JSON
    call jsonwritetofile(suite, "fortstestresults.json")

    ! check the result
    call suite%checkfailure()

end program unittests
