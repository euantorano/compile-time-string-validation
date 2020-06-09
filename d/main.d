enum Promises
{
    stdio,
    rpath,
    wpath,
    cpath,
    dpath
};

bool validatePromises(string promises)
{
    import std.algorithm.iteration : splitter;
    import std.conv : parse, ConvException;

    auto promisesSplitter = promises.splitter(' ');

    foreach (s; promisesSplitter)
    {
        try
        {
            parse!Promises(s);
        }
        catch (ConvException)
        {
            return false;
        }
    }

    return true;
}

void promise(string promises)()
{
    static assert(validatePromises(promises), "invalid promises: " ~ promises);

    import std.stdio : writeln;

    writeln("valid promises: ", promises);
}

void main()
{
    version (invalidPromises)
    {
        promise!"stdio foobar";
    }
    else
    {
        promise!"stdio rpath wpath";
    }
}