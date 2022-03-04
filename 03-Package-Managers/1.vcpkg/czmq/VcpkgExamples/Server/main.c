#include <zmq.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <Windows.h>

#ifdef _DEBUG
#pragma comment(lib,"libzmq-mt-sgd-libzmq-mt-s-4_3_4.lib")
#else
#pragma comment(lib,"libzmq-mt-s-4_3_4.lib")
#endif
#pragma comment(lib,"Ws2_32.lib")
#pragma comment(lib,"Iphlpapi.lib")

int main(void)
{
    //  Socket to talk to clients
    void* context = zmq_ctx_new();
    void* responder = zmq_socket(context, ZMQ_REP);
    int rc = zmq_bind(responder, "tcp://*:5555");
    assert(rc == 0);

    while (1) {
        char buffer[10];
        zmq_recv(responder, buffer, 10, 0);
        printf_s("Received %s\n", buffer);
        Sleep(1);          //  Do some 'work'
        zmq_send(responder, "World", 5, 0);
    }
    return 0;
}