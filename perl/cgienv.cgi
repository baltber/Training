#!/bin/bash
# showCGIenv -- выводит CGI-окружение, которое получает любой
# CGI-сценарий в этой системе.
echo "Content-type: text/html"
echo ""
# Вывести фактические сведения...
echo "<html><body bgcolor=\"white\"><h2>CGI Runtime Environment</h2>"
echo "<pre>"
env || printenv
echo "</pre>"
echo "<h3>Input stream is:</h3>"
echo "<pre>"
cat -
echo "(end of input stream)</pre></body></html>"
exit 0
