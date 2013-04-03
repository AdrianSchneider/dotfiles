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

        $testFile = substr($testFile, strpos($testFile, 'src/'));
        $sourceFile = str_replace(array('src/', 'Tests/', 'Test.php'), array('', ''), $testFile);
        $sourceClass = str_replace(DIRECTORY_SEPARATOR, '\\', $sourceFile);

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
