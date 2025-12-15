#include <cstdlib>
// {fmt} lib for format print, with compatibility for low version c++ standard
#include <fmt/base.h>

auto main( int argc, char* argv[] ) -> int
{
    ( void )argc;
    ( void )argv;

    fmt::println( "Hello world from {{fmt}}." );

    return EXIT_SUCCESS;
}
