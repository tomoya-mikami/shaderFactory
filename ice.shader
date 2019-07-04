Shader "Custom/alpha"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
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
            float3 viewDir;
            float3 worldNormal;
        };

        float _Alpha;
        fixed4 _Color;

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = _Color;
            float alpha = 1 - abs(dot(IN.viewDir, IN.worldNormal));
            o.Alpha = _Alpha * alpha;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
