#include "toml.hpp"
#include <iostream>
using namespace std;

int main()
{
    auto config = toml::parse_file( "./galotfa.toml" );

    // get key-value pairs use a visitor to iterate over heterogenous data
    config.for_each( []( auto& key, auto& value ) {
        if ( string_view( key ).substr( 0, 9 ) == "component" )
            std::cout << key << "\n";
        ( void )value;
    } );

    // get a nested table
    toml::table orbit = *config[ "orbit" ].as_table();
    orbit.for_each( []( auto& key, auto& value ) {
        cout << "Key:" << key << endl;
        if constexpr ( toml::is_string< decltype( value ) > )
        {
            cout << "Value:" << "(" << value.type() << "): " << value << endl;
        }
        else if constexpr ( toml::is_node< decltype( value ) > )
        {
            cout << "Get a node:" << endl;
            cout << "Value" << "(type: " << value.type() << "): " << endl << value << endl;
        }
    } );

    // int
    int maxIter = config[ "global" ][ "maxiter" ].value_or( 0 );
    // double
    double epsilon = config[ "global" ][ "epsilon" ].value_or( 0.0 );
    // bool
    // bool enableRecenter = config[ "component1" ][ "recenter.enable" ].value_or( true );
    bool enableRecenter = *config[ "component1" ][ "recenter" ][ "enable" ].value< bool >();
    // string
    string_view outDir   = config[ "global.outdir" ].value_or( "./otfLogs"sv );
    string_view filename = config[ "global" ][ "filename" ].value_or( "galotfa.hdf5"sv );

    cout << "Output at [" << outDir << "]: [" << filename << "]" << endl;
    cout << "Max iteration:" << maxIter << endl;
    cout << "Equal threshold of floating-point number: " << epsilon << endl;
    if ( enableRecenter )
        cout << "The recenter is enabled." << endl;
    else
        cout << "The recenter is disabled." << endl;

    if ( filename == "galotfa.hdf5" )
        cout << "Using default filename" << endl;

    // array
    auto   iguess = config[ "component1" ][ "recenter" ][ "iguess" ];
    double x      = *iguess[ 0 ].value< unsigned int >();
    double y      = *iguess[ 1 ].value< double >();
    double z      = *iguess[ 2 ].value< double >();
    std::cout << "iguess: " << x << ", " << y << ", " << z << "\n";

    auto numbers = config[ "orbit" ][ "logtypes" ];
    if ( toml::array* arr = numbers.as_array() )
    {
        // visitation with for_each() helps deal with heterogeneous data
        arr->for_each( []( auto el ) {
            if constexpr ( toml::is_number< decltype( el ) > )
            {
                double tmp = *el;
                cout << tmp << endl;
            }
        } );
    }
    return 0;
}
