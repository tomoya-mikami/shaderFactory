Shader "Custom/texture"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white"{}
        _Ratio("Ratio", float) = 0.2
        _Alpha ("Alpha", float) = 0.6
    }
    SubShader
    {
        Tags { "Queue"="Transparent" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard alpha:fade

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        struct Input
        {
            float2 uv_MainTex;
        };

        sampler2D _MainTex;
        float _Ratio;
        float _Alpha;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 color = tex2D(_MainTex, IN.uv_MainTex);
            o.Albedo = color;
            o.Alpha = (color.r * 0.3 + color.g * 0.6 + color.b * 0.1 < _Ratio) ? 1 : _Alpha;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
