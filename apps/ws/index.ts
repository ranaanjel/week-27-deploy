import { prismaClient } from "@repo/db/client";

Bun.serve({
    port:8081,
    fetch(req,server) {

        if(server.upgrade(req)) {
            return
        }

        return new Response("Upgrade failed", {status:500})

    },
    websocket: {
        message(ws, message) {
            prismaClient.user.create({
                data:{
                    username:Math.random().toString(),
                    password:Math.random().toString(),
                }
            }).then(m => {
                console.log(m.id, "added to the database")
            })

            ws.send(
                message)
        }


    }
})