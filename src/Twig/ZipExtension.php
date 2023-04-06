<?php
// src/Twig/Extension/ZipExtension.php

namespace App\Twig\Extension;

use Twig\Extension\AbstractExtension;
use Twig\TwigFilter;

class ZipExtension extends AbstractExtension
{
    public function getFilters()
    {
        return [
            new TwigFilter('zip', [$this, 'zipArrays']),
        ];
    }

    public function zipArrays($array1, $array2)
    {
        return array_map(null, $array1, $array2);
    }
}
?>