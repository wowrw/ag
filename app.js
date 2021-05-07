const express=require('express');
const bodyparser=require('body-parser');
const session=require('express-session');
const userRouter=require('./routes/user.js');
const productRouter=require('./routes/product.js');
const indexRouter=require('./routes/index');
const cartRouter=require('./routes/cart');
//创建web服务器
let app=express();
app.listen(80);
// 使用 session 中间件

app.use(session({
    secret :  'secret', // 对session id 相关的cookie 进行签名
    resave : true,
    saveUninitialized: false, // 是否保存未初始化的会话
    cookie : {
        maxAge : 1000 * 60 * 3, // 设置 session 的有效时间，单位毫秒
    },
}));



//托管静态资源(html,css,js,图像)，内置中间件
app.use(express.static('public'));
//第三方中间件，主体解析
app.use(bodyparser.urlencoded({
    extended:false    //使用核心模块querystring,不使用第三方模块qs
}));
//把用户路由器挂载到服务器  给url添加前缀/user
app.use('/user',userRouter);
app.use('/product',productRouter);
app.use('/cart',cartRouter);
app.use(indexRouter);
