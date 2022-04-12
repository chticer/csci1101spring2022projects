using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    public Rigidbody player;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void FixedUpdate()
    {
        int xDirection = 0;
        int zDirection = 0;

        if (Input.GetKey("d"))
            xDirection = 1;
        else if (Input.GetKey("a"))
            xDirection = -1;

        if (Input.GetKey("w"))
            zDirection = 1;
        else if (Input.GetKey("s"))
            zDirection = -1;

        player.AddForce(xDirection * 1000 * Time.deltaTime, 0, zDirection * 1000 * Time.deltaTime);
    }
}
