// MIT License

// Copyright (c) 2021 Daniil Archangelsky (Kiky Tokamuro)

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import std.stdio;
import std.socket;
import std.array;
import std.format;
import std.conv;
import core.stdc.stdlib : exit;

void finger(string login, string host, ushort port)
{
	TcpSocket socket;

	try
	{
		socket = new TcpSocket(new InternetAddress(host, port));
	}
	catch (Exception e)
	{
		writeln(e.msg);
		exit(1);
	}

	socket.send(format("%s\r\n", login));

	char[] response;
	char[1] buffer;

	while (socket.receive(buffer))
	{
		response ~= buffer;
		if (buffer[0] == '\0')
			break;
	}

	writeln(response);
}

void usage(string name)
{
	writefln("Usage: %s <user>[@<host>] [<port> default 79]", name);
	exit(1);
}

void main(string[] args)
{
	if (args.length < 2)
		usage(args[0]);

	string[] items = args[1].split("@");

	if (items.length == 0)
		usage(args[0]);

	string user = items[0];
	string host;

	if (items.length == 1)
	{
		host = "localhost";
	}
	else if (items.length == 2)
	{
		host = items[1];
	}
	else
	{
		usage(args[0]);
	}

	ushort port = 79;

	if (args.length == 3) 
	{
		try
		{
			port = to!ushort(args[2]);
		}
		catch (Exception e)
		{
			usage(args[0]);
		}
	}

	finger(user, host, port);
}