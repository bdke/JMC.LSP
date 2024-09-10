﻿namespace JMC.Parser.Command;

internal static class AttributeExtensions
{
    public static TValue? GetAttributeValue<TAttribute, TValue>(
        this Type type,
        Func<TAttribute, TValue> valueSelector)
        where TAttribute : Attribute
    {
        return type.GetCustomAttributes(
            typeof(TAttribute), true
        ).FirstOrDefault() is TAttribute att ? valueSelector(att) : default;
    }
}