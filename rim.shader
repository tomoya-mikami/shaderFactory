Shader "Custom/color"
{
    Properties
    {
        _BaseColor ("Base Color", Color) = (200, 1, 1, 1)
        _RimColor ("Rim Color", Color) = (200, 1, 1, 1)
        _Emission ("Emission", float) = 0.6
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
            float3 viewDir;
            float3 worldNormal;
        };

        fixed4 _BaseColor;
        float _Emission;
        fixed4 _RimColor;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            //o.Albedo = _BaseColor.rgb;
            o.Albedo = _BaseColor;

            float rim = 1 - abs(dot(IN.viewDir, IN.worldNormal));
            o.Emission = _RimColor * pow(rim, 3);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
