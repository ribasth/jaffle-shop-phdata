{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- if target.name == 'deploy' -%}
        {# Run is a DEV, TST, or PRD deployment. Use MODELED or the given custom schema name. #}
        {%- if custom_schema_name is none -%}
            {{ target.schema | trim }}
        {%- else -%}
            {{ custom_schema_name | trim }}
        {%- endif -%}
    {%- elif custom_schema_name is none -%}
        {# Run is PR deployment or user development, without custom schema. Use the configured default schema. #}
        {{ target.schema | trim }}
    {%- else -%}
        {# Run is PR deployment or user development. Prefix custom schema with configured default schema. #}
        {{ target.schema | trim }}_{{ custom_schema_name | trim }}
    {%- endif -%}
{%- endmacro -%}