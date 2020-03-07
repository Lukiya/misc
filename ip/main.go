package main

import (
	realip "github.com/Ferluci/fast-realip"
	log "github.com/kataras/golog"
	"github.com/valyala/fasthttp"
)

func main() {
	addr := ":9901"
	log.Info("Listening on " + addr)
	fasthttp.ListenAndServe(addr, func(ctx *fasthttp.RequestCtx) {
		clientIP := realip.FromRequest(ctx)
		ctx.WriteString(clientIP)
	})
}
