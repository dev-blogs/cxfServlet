# cxfServlet

Проект описан в посте http://dev-blogs.com/cxfservlet/

Прежде чем собрать проект замените в файле build.sh значение переменной PATH_TO_DEPLOY на путь к вашему контейнеру сервлетов

Чтобы собрать проект запустите из под командной строки билд скрипт ./build.sh

Проект собирется и задеплоится по указанному в переменной PATH_TO_DEPLOY пути

Затем зайдите в в ваш контейнер сервелетов и запустите его:

/path/to/your/container_servlet/bin/startup.sh

После этого проверьте рест кол: http://localhost:8080/cxfServlet/rest/test-service/test
