/* * ************************************************************ 
 * Date: 28 Feb, 2018
 * programmer: Shani Mahadeva <satyashani@gmail.com>
 * Javascript file app.js
 * *************************************************************** */

var AWS = require('aws-sdk'); 
var http = require("http");
var express = require('express');
var config = require("./config");

var credentials = new AWS.SharedIniFileCredentials({profile: config.aws.profile || 'default'});
AWS.config.credentials = credentials;
var s3 = new AWS.S3(); 

var getFile = function(url,callback){
    var params = {Bucket: config.aws.bucket, Key: url};
    var call = s3.getObject(params);
    call.on('success', function(response) {
        callback(null,response.data);
    }).on('error', function(err) {
        callback(err);
    });
    call.send();
};

var app = express();
app.get("*",function(req,res){
    getFile(req.path,function(err,data){
        if(!err && data && data.Body){  
            res.set({
                'Content-Type': data.ContentType,
                'Content-Length': data.ContentLength,
                'ETag': data.ETag
            });
            res.send(200,data.Body);
        }
        else{
            res.send(404,err.message);
        }
    });
});

http.createServer(app).listen(config.app.port, function(){
    console.log('Express server listening on port ' + config.app.port);
});

