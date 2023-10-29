Shader "Unlit/shader_test1"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        [MainColor] _BaseColor("Color", Color) = (1, 1, 1, 1)
         _Value1 ("Value 1", float) = 2.5
          _Value2 ("Value 2", float) = 2.5
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex VertexShaderFunc
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

               sampler2D _MainTex;
            float4 _MainTex_ST;

            float _Value1;
            float _Value2;
            float4 _BaseColor;

            struct MeshData
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct FragInput
            {
                float2 uv : TEXCOORD0;
                
                float4 vertex : SV_POSITION;
            };

         

            FragInput VertexShaderFunc (MeshData v)    //this is the vertext shader it returns infor for the fragement shader ot use.
            {
                FragInput o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
               
                return o;
            }

            float4 frag (FragInput i) : SV_Target
            {
                // sample the texture
                float4 col = tex2D(_MainTex, i.uv);
                col = col * _BaseColor * _SinTime.w;
               

              
               
                return col;
            }
            ENDCG
        }
    }
}
