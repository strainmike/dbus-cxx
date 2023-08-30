// SPDX-License-Identifier: LGPL-3.0-or-later OR BSD-3-Clause
/***************************************************************************
 *   Copyright (C) 2007,2008,2009 by Rick L. Vinyard, Jr.                  *
 *   rvinyard@cs.nmsu.edu                                                  *
 *                                                                         *
 *   This file is part of the dbus-cxx library.                            *
 ***************************************************************************/
#include "dispatcher.h"

#ifdef _WIN32
#include <dbus-cxx/error.h>
#include <sys/socket.h>
#endif

namespace DBus {
Dispatcher::Dispatcher() {
    #ifdef _WIN32
    // Initialize Winsock2
    WSADATA WsaData = { 0 };
    int result = WSAStartup( MAKEWORD(2, 2), &WsaData );
    if ( result != 0 ) {
        throw ErrorDispatcherInitFailed();
    }
    #endif
}

Dispatcher::~Dispatcher() {
    #ifdef _WIN32
    WSACleanup();
    #endif
}

}
