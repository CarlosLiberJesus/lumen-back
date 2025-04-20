<?php

declare(strict_types=1);

namespace App\Helpers;

final class StringHelper
{
    /** @var array<int, string> */
    private static array $portugueseLowercase = [
        'do', 'dos', 'da', 'das', 'de', 'e', 'o', 'os', 'a', 'as',
    ];

    public static function titlePt(string $text): string
    {
        // First convert everything to lowercase
        $text = mb_strtolower($text);

        // Split into words and process each
        $words = explode(' ', $text);
        foreach ($words as $i => $word) {
            $lowerWord = mb_strtolower($word);

            // Always capitalize first word
            if ($i === 0) {
                $words[$i] = mb_convert_case($word, MB_CASE_TITLE, 'UTF-8');

                continue;
            }

            // Keep prepositions/articles lowercase only if they're connecting words
            if (in_array($lowerWord, self::$portugueseLowercase, true)) {
                $words[$i] = $lowerWord;

                continue;
            }

            // For words with 3 or fewer characters that aren't in our lowercase list,
            // preserve their original case if they're all uppercase
            if (mb_strlen($word) <= 3 && mb_strtoupper($word) === $word) {
                $words[$i] = mb_strtoupper($word);

                continue;
            }

            // Default case: capitalize first letter
            $words[$i] = mb_convert_case($word, MB_CASE_TITLE, 'UTF-8');
        }

        return implode(' ', $words);
    }

    public static function toSafeString(mixed $value): string
    {
        if (is_null($value)) {
            return 'NULL';
        }

        if (is_bool($value)) {
            return $value ? 'TRUE' : 'FALSE';
        }

        if (is_array($value)) {
            return json_encode($value) ?: '[array]';
        }

        if (is_object($value)) {
            if (method_exists($value, '__toString')) {
                $stringValue = $value->__toString();

                return $stringValue !== '' ? $stringValue : $value::class;
            }

            return $value::class;
        }

        if (is_string($value)) {
            return $value;
        }

        if (is_int($value) || is_float($value)) {
            return (string) $value;
        }

        // Fallback for any other type
        return '[unknown]';
    }
}
