using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerCollision : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void OnCollisionEnter(Collision c)
    {
        if (Equals(c.gameObject.tag, "wall"))
        {
            Debug.Log("Player hit a wall...what should we do?");

            // Player loses HP.
            // Restart the level.
            // Spawn more enemies.
        }
    }
}
