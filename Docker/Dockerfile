

-----------------------------------------------  Dockerfile  ----------------------------------------------------------------
Docker 在运行时分为 Docker 引擎（也就是服务端守护进程）和客户端工具。Docker 的引擎提供了一组 REST API，被称为 Docker Remote API，
而如 docker 命令这样的客户端工具，则是通过这组 API 与 Docker 引擎交互，从而完成各种功能。 因此，虽然表面上我们好像是在本机执行各种 
docker 功能，但实际上，一切都是使用的远程调用形式在服务端（Docker 引擎）完成。 也因为这种 C/S 设计，让我们操作远程服务器的 Docker 
引擎变得轻而易举。

镜像构建上下文（Context）

如果注意，会看到 docker build 命令最后有一个 .。. 表示当前目录，而 Dockerfile 就在当前目录，因此不少初学者以为这个路径是在指定 
Dockerfile 所在路径，这么理解其实是不准确的。如果对应上面的命令格式，你可能会发现，这是在指定上下文路径。那么什么是上下文呢？
当构建的时候，用户会指定构建镜像上下文的路径，docker build 命令得知这个路径后，会将路径下的所有内容打包，然后上传给 Docker 引擎。
这样 Docker 引擎收到这个上下文包后，展开就会获得构建镜像所需的一切文件。

理解构建上下文对于镜像构建是很重要的，避免犯一些不应该的错误
初学者经常会问的为什么 COPY ../package.json /app 或者 COPY /opt/xxxx /app 无法工作的原因，因为这些路径已经超出了上下文的范围，
Docker 引擎无法获得这些位置的文件。如果真的需要，应该将它们复制到上下文目录中去。 

有些初学者在发现 COPY /opt/xxxx /app 不工作后，于是干脆将 Dockerfile 放到了硬盘根目录去构建，结果发现 docker build 执行后，
在发送一个几十 GB 的东西，极为缓慢而且很容易构建失败。那是因为这种做法是在让 docker build 打包整个硬盘，这显然是使用错误。

一般来说，应该会将 Dockerfile 置于一个空目录下，或者项目根目录下。如果该目录下没有所需文件，那么应该把所需文件复制一份过来。
如果目录下有些东西确实不希望构建时传给 Docker 引擎，那么可以用 .gitignore 一样的语法写一个 .dockerignore，该文件是用于剔除不需要
作为上下文传递给 Docker 引擎的。

那么为什么会有人误以为 . 是指定 Dockerfile 所在目录呢？这是因为在默认情况下，如果不额外指定 Dockerfile 的话，会将上下文目录下的名
为 Dockerfile 的文件作为 Dockerfile。 这只是默认行为，实际上 Dockerfile 的文件名并不要求必须为 Dockerfile，而且并不要求必须位于
上下文目录中，比如可以用 -f ../Dockerfile.php 参数指定某个文件作为 Dockerfile。当然，一般大家习惯性的会使用默认的文件名 Dockerfile，
以及会将其置于镜像构建上下文目录中。
