using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class basicSpawner : MonoBehaviour


{
    public GameObject ObjectToSpawn;
    public float start;
    public float repeat;
    // Start is called before the first frame update
    void Start()
    {
         InvokeRepeating("Spawner", start, repeat); //calls the function named, starting at start time and repeating the repeat time
    } 

    void Spawner()
    {
        Instantiate(ObjectToSpawn, new Vector3(Random.Range(-0.30f, 0.30f), 3.0f, Random.Range(0.30f, 0.60f)), Quaternion.Euler(Random.Range(0.0f,180.0f), 0.0f,Random.Range(0.0f,180.0f)));
    }
}
