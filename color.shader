﻿Shader "Custom/color"
{
    Properties
    {
        _BaseColor ("Base Color", Color) = (200, 1, 1, 1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        fixed4 _BaseColor;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            //o.Albedo = _BaseColor.rgb;
            o.Albedo = _BaseColor;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
