PATH_TO_DEPLOY=/path/to/your/servlet_container
PROJECT_NAME=cxfServlet
 
# Удаляем каталог с предыдущим билдом
if test -d build;
then
    rm -rf build
fi
# Создаем новый каталог, куда будем помещать билд
mkdir build
 
# Копируем туда заранее заготовленный каталог WEB-INF c web.xml
cp -r WEB-INF build
mkdir build/WEB-INF/classes
 
# Компилируем проект в каталог build/WEB-INF/classes
javac -d build/WEB-INF/classes -cp .:lib/* $(find src/* | grep .java)
 
# Копируем все необходимые для CXF библиотеки в build/WEB-INF
cp -r lib build/WEB-INF
 
# Переходим в каталог build
cd build
 
# Создаем war архив
jar cvf $PROJECT_NAME.war WEB-INF
 
# war архив создан и готов для деплоя
# Удалим из каталога контейнера webapps предыдущее приложение (и варник тоже)

# переходим в корневой каталог приложения
cd ..
# запоминаем корневой каталог приложения
HOME_PROJECT=`pwd`

cd $PATH_TO_DEPLOY
if test -d $PROJECT_NAME;
then
    rm -rf $PROJECT_NAME
fi
if test -d $PROJECT_NAME.war;
then
    rm -rf $PROJECT_NAME.war
fi
# Возвращаемся в каталог с новым билдом
cd $HOME_PROJECT/build
 
# Собсно деплой
cp $PROJECT_NAME.war $PATH_TO_DEPLOY
 
cd ..
