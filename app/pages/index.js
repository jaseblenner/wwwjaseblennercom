import Head from 'next/head'
import Image from 'next/image'
import { Inter } from 'next/font/google'
import styles from '@/styles/Home.module.css'

const inter = Inter({ subsets: ['latin'] })

export default function Home() {
  return (
    <>
      <Head>
        <title>jaseblenner.com</title>
        <meta name="description" content="jaseblenner.com landing page" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" href="/images/favicon.ico" />
      </Head>
      <main className={`${styles.main} ${inter.className}`}>
        <div className={styles.description}>
          <p> hosted <span> @ </span>
            <code className={styles.code}>
              <a href="https://www.github.com/jaseblenner/wwwjaseblennercom">github</a>
              </code>
              </p>
              <div>
            <Image
              src="/images/location.svg"
              alt="location"
              className={styles.locationLogo}
              width={24}
              height={24}
              priority
            />
            <span> Melbourne, AU</span>
          </div>
        </div>

        <div className={styles.center}>
          <Image
            className={styles.logo}
            src="/images/jaseblennertext.svg"
            alt="jaseblenner text logo"
            width={180}
            height={37}
            priority
          />
        </div>

        <div className={styles.grid}>
          <a
            href="mailto:hello@jaseblenner.com"
            className={styles.card}
            target="_blank"
            rel="noopener noreferrer"
          >
            <h2>
              email <span>-&gt;</span>
            </h2>
            <p>
              email me
            </p>
          </a>

          <a
            href="https://www.linkedin.com/in/jaseblenner/"
            className={styles.card}
            target="_blank"
            rel="noopener noreferrer"
          >
            <h2>
              linkedin <span>-&gt;</span>
            </h2>
            <p>
              contact me on linkedin
            </p>
          </a>
        </div>
      </main>
    </>
  )
}
