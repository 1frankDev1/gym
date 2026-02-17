import asyncio
from playwright.async_api import async_playwright
import os

async def main():
    async with async_playwright() as p:
        browser = await p.chromium.launch()
        page = await browser.new_page()

        # Verify Login Page
        await page.goto(f'file://{os.getcwd()}/docs/login.html')
        await page.screenshot(path='login_page_v2.png')
        print("Login page screenshot saved as login_page_v2.png")

        # Check if "Usuario" label exists
        usuario_label = await page.query_selector('label:has-text("Usuario")')
        if usuario_label:
            print("Found 'Usuario' label on login page.")
        else:
            print("CRITICAL: 'Usuario' label NOT found on login page.")

        # Verify Admin Gym Page (mocking role)
        await page.evaluate("localStorage.setItem('userRole', 'admin')")
        await page.goto(f'file://{os.getcwd()}/docs/adminGym.html')
        await page.screenshot(path='admin_gym_v2.png')
        print("Admin Gym page screenshot saved as admin_gym_v2.png")

        # Check if "Usuario" field exists in registration form
        reg_usuario_field = await page.query_selector('#regUsuario')
        if reg_usuario_field:
            print("Found 'Usuario' input field in admin registration form.")
        else:
            print("CRITICAL: 'Usuario' input field NOT found in admin registration form.")

        await browser.close()

if __name__ == "__main__":
    asyncio.run(main())
