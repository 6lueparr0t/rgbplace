<?php

namespace Model;
class Database
{
    private static $host = "localhost";
    private static $username = "scallop99";
    private static $password = "godo1234!@";
    private static $database = "scallop99_godohosting_com";

    public static function sql($query)
    {
        $link = mysqli_connect(self::$host, self::$username, self::$password, self::$database);

        if (mysqli_connect_errno()) {
            printf("Connect failed: %s\n", mysqli_connect_error());
            exit();
        }

        if ($result = mysqli_query($link, $query)) {

            if (mysqli_num_rows($result) > 0) {

                $row = $result->fetch_all();

            } else {

                $row = "";

            }

        }

        mysqli_free_result($result);
        mysqli_close($link);

        return $row;
    }

    public static function query($query)
    {
        $link = mysqli_connect(self::$host, self::$username, self::$password, self::$database);

        if (mysqli_connect_errno()) {
            printf("Connect failed: %s\n", mysqli_connect_error());
            exit();
        }

        $result = mysqli_query($link, $query);

        mysqli_close($link);

        return true;
    }


}