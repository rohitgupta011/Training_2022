// Create server using http in node
const http=require('http');
// What server will do when a request comes
function onRequest(request,response){
    response.setHeader('Content-Type','text/text');
    response.write("Welcome to server programming");    
    response.end();
}
//create the server logic to handle the request
const server=http.createServer(onRequest);
//created server is listening to the request at dedicated port
const port=3000; //0-65535
//when server starts listening give message 
// ${port} this will give value of port variable
// localhost : 127.0.0.1
function onServerStart(){
    console.log(`http://localhost:${port} started `);
}
server.listen(port,onServerStart);