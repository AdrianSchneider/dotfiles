<?php

class TestFinder
{
    public function classToFile($className)
    {
        return sprintf('src/%s.php', str_replace('/', '\\', $className));

    }

    public function findTestFile($inputFile)
    {
        if (strpos($inputFile, 'Test.php') !== false) {
            return $inputFile;
        }

        $parts = explode('/', str_replace('.php', '', $inputFile));

        $out = array();
        foreach ($parts as $dir) {
            if ($dir == 'src') {
                $dir = 'test';
            }
            $out[] = $dir;
        }

        return implode(DIRECTORY_SEPARATOR, $out) . 'Test.php';
    }

    public function findOldTestFile($inputFile)
    {
        if (strpos($inputFile, 'Test.php') !== false) {
            return $inputFile;
        }

        $parts = explode('/', str_replace('.php', '', $inputFile));
        $split = $this->findSplitPoint($parts);

        $out = array();
        foreach ($parts as $dir) {
            $out[] = $dir;
            if ($dir == $split) {
                $out[] = 'Tests';
            }
        }

        return implode(DIRECTORY_SEPARATOR, $out) . 'Test.php';
    }

    public function findClassToTest($testFile)
    {
        // src/Vendor/Tests/ClassName.php
        $testPrefixes = array('test', 'tests', 'Tests');
        foreach ($testPrefixes as $prefix) {
            if (false !== $pos = strpos($testFile, "/$prefix/")) {
                break;
            }
        }

        $topLevelDirs = array('src', 'lib', 'tests', 'test');
        foreach (explode('/', $testFile) as $part) {
            if (in_array($part, $topLevelDirs)) {
                $start = "$part/";
                break;
            }
        }

        $testFile = substr($testFile, strpos($testFile, $start));
        $sourceFile = str_replace(array('src/', 'test', 'tests', 'Tests/', 'Test.php'), array('', '', '', ''), $testFile);
        $sourceClass = trim(str_replace(DIRECTORY_SEPARATOR, '\\', $sourceFile), '\\');

        return $sourceClass;
    }

    protected function findSplitPoint(array $parts)
    {
        foreach (array_reverse($parts) as $dir) {
            if ($dir == 'Component') {
                return $lastPart;
            }

            if (strpos($dir, 'Bundle') !== false or strpos($dir, 'Component') !== false) {
                return $dir;
            }

            $lastPart = $dir;
        }  

        foreach ($parts as $part) {
            if (preg_match('/^([A-Z]+)/', $part)) {
                return $part;
            }
        }

        throw new Exception('Cannot find split point');
    }
}
