test_incl = [libhello_incl]

test_srcs = ['source.cpp']

testexe = executable('testexe',
                test_srcs,
                include_directories: test_incl,
                link_with: libhello_lib)

test('testexe', testexe)