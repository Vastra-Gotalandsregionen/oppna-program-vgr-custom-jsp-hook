According to LPS-22864:

http://issues.liferay.com/browse/LPS-22864

Issues with CKEditor not loading depends on toolbars not ready when trying to instantiate them. Solution is to move toolbar initializaion further down.