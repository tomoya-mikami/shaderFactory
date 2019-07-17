using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PositionPost : MonoBehaviour
{
    private MaterialPropertyBlock propertyBlock;

    private Renderer rend;

    // Start is called before the first frame update
    void Start()
    {
        this.rend = this.GetComponent<Renderer>();
        this.propertyBlock = new MaterialPropertyBlock();
    }

    // Update is called once per frame
    void Update()
    {
        this.propertyBlock.Clear();
        this.propertyBlock.SetVector("_ObjectPosition", transform.position);
        this.rend.SetPropertyBlock(this.propertyBlock);
    }
}
