# d2r

Original idea from Gemini.

```python
import random

def simulate_herald_spawns(total_elites, spawn_chance=0.20, token_chance=0.20):
    """
    Simulates Herald spawning based on elite kills and token checks.
    
    Args:
        total_elites (int): Number of elite packs (Champions/Uniques) killed.
        spawn_chance (float): Chance to spawn a Herald after getting a token.
        token_chance (float): Chance to 'Draw Ire' (receive a token) from an elite kill.
    """
    heralds_spawned = 0
    tokens_received = 0
    
    for _ in range(total_elites):
        # Step 1: Check if elite kill grants a token ('Draw Ire')
        if random.random() < token_chance:
            tokens_received += 1
            
            # Step 2: Once token is held, check if next elite pack spawns a Herald
            # Based on community testing, these often happen in succession
            if random.random() < spawn_chance:
                heralds_spawned += 1
                
    return tokens_received, heralds_spawned

# --- Configuration ---
ELITE_PACKS_PER_RUN = 50  # Typical dense Terror Zone (e.g., Chaos Sanctuary/Cows)
TOTAL_RUNS = 1000
total_elites_tested = ELITE_PACKS_PER_RUN * TOTAL_RUNS

t_tokens, t_heralds = simulate_herald_spawns(total_elites_tested)

print(f"--- Simulation Results ({TOTAL_RUNS} Runs) ---")
print(f"Total Elite Packs Killed: {total_elites_tested}")
print(f"Total 'Draw Ire' Tokens:  {t_tokens} (Rate: {(t_tokens/total_elites_tested)*100:.2f}%)")
print(f"Total Heralds Spawned:   {t_heralds} (Rate: {(t_heralds/total_elites_tested)*100:.2f}%)")
print(f"Average Heralds Per Run: {t_heralds/TOTAL_RUNS:.2f}")
```

Formula:
<img width="1235" height="375" alt="image" src="https://github.com/user-attachments/assets/4537ff2d-c3d2-49a0-ac71-18cbb2a9c948" />
<img width="663" height="113" alt="image" src="https://github.com/user-attachments/assets/deed2252-4864-411f-a276-975c8a6f4b06" />


