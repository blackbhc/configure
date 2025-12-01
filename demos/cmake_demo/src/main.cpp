#include <print>

int main( int argc, char* argv[] )
{
    ( void )argc;
    ( void )argv;
    std::println( "Hello world. There are {} arguments.", argc );
    return 0;
}
